/**
 * 网格动画类，用于创建带有动画效果的网格界面
 * 支持鼠标交互、蛇形动画和特殊块效果
 */
class GridAnimation {
    /**
     * 构造函数
     * @param {HTMLCanvasElement} canvas - 要绑定的Canvas元素
     * @param {object} options - 配置选项
     */
    constructor(canvas, options = {}) {
        this.canvas = canvas;
        this.ctx = canvas.getContext("2d");
        this.options = {
            direction: options.direction || "right",
            speed: options.speed || 1,
            borderColor: options.borderColor || "rgba(255, 255, 255, 0.05)",
            squareSize: options.squareSize || 40,
            hoverFillColor: options.hoverFillColor || "rgba(255, 255, 255, 0.6)",
            hoverShadowColor: options.hoverShadowColor || "rgba(255, 255, 255, 0.3)",
            transitionDuration: options.transitionDuration || 200,
            trailDuration: options.trailDuration || 1000,
            specialBlockColor: options.specialBlockColor || "rgba(255, 100, 100, 0.8)",
            specialHoverColor: options.specialHoverColor || "rgba(100, 255, 100, 0.8)",
            snakeHeadColor: options.snakeHeadColor || "rgba(255, 255, 255, 0.9)",
            snakeTailColor: options.snakeTailColor || "rgba(100, 100, 255, 0.3)",
            snakeGradientStops: options.snakeGradientStops || 5,
            snakeColorDecay: options.snakeColorDecay || 0.7,
        };
        this.gridOffset = { x: 0, y: 0 };
        this.hoveredSquare = null;
        this.animationFrame = null;
        this.currentOpacity = 0;
        this.targetOpacity = 0;
        this.lastTimestamp = 0;
        this.hoverRadius = 3;
        this.trailSquares = new Map();
        this.specialBlock = null;
        this.specialBlockTimer = null;
        this.isSpecialBlockHovered = false;
        this.snakeBody = [];
        this.shouldGrow = false;
    }

    /**
     * 初始化动画
     */
    init() {
        this.resizeCanvas();
        this.setupEventListeners();
        this.animate();

        // 检查是否为手机设备
        const isPhone = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
        if (isPhone) {
            setTimeout(() => {
                this.createSpecialBlock();
            }, 500);
        } else {
            this.createSpecialBlock();
        }

        // 处理页面可见性变化
        const visibilityChangeEvent = "visibilitychange";
        const hiddenProperty = "hidden" in document ? "hidden" :
            "mozHidden" in document ? "mozHidden" :
                "webkitHidden" in document ? "webkitHidden" : "";
        document.addEventListener(visibilityChangeEvent, this.handleVisibilityChange.bind(this));
    }

    /**
     * 调整Canvas尺寸
     */
    resizeCanvas() {
        const t = window.devicePixelRatio || 1;
        const e = this.canvas.offsetWidth;
        const i = this.canvas.offsetHeight;

        this.canvas.width = Math.floor(e * t);
        this.canvas.height = Math.floor(i * t);
        this.canvas.style.width = `${e}px`;
        this.canvas.style.height = `${i}px`;
        this.ctx.scale(t, t);
    }

    /**
     * 设置事件监听器
     */
    setupEventListeners() {
        window.addEventListener("resize", () => this.resizeCanvas());
        this.canvas.addEventListener("mousemove", (t) => this.handleMouseMove(t));
        this.canvas.addEventListener("mouseleave", () => this.handleMouseLeave());

        // 处理手机方向变化
        const isPhone = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
        if (isPhone && typeof window.orientation !== "undefined") {
            window.addEventListener("orientationchange", () => {
                setTimeout(() => {
                    this.resizeCanvas();
                    this.createSpecialBlock();
                }, 300);
            });
        }
    }

    /**
     * 处理鼠标移动事件
     * @param {MouseEvent} t - 鼠标事件对象
     */
    handleMouseMove(t) {
        const e = this.canvas.getBoundingClientRect();
        const i = t.clientX - e.left;
        const y = t.clientY - e.top;
        const gridX = Math.floor(this.gridOffset.x / this.options.squareSize) * this.options.squareSize;
        const gridY = Math.floor(this.gridOffset.y / this.options.squareSize) * this.options.squareSize;
        const hoverX = Math.floor((i + this.gridOffset.x - gridX) / this.options.squareSize);
        const hoverY = Math.floor((y + this.gridOffset.y - gridY) / this.options.squareSize);

        // 检查是否与当前悬停方块相同
        if ((this.hoveredSquare && this.hoveredSquare.x === hoverX && this.hoveredSquare.y === hoverY)) {
            return;
        }

        // 处理悬停方块变化
        if (this.hoveredSquare) {
            this.snakeBody.unshift({
                x: this.hoveredSquare.x,
                y: this.hoveredSquare.y
            });
            if (!this.shouldGrow && this.snakeBody.length > 0) {
                this.snakeBody.pop();
            }
            this.shouldGrow = false;
        }

        this.hoveredSquare = { x: hoverX, y: hoverY };
        this.targetOpacity = 0.6;

        // 检查是否悬停在特殊块上
        if (this.specialBlock && hoverX === this.specialBlock.x && hoverY === this.specialBlock.y) {
            this.shouldGrow = true;
            this.createSpecialBlock();
        }
    }

    /**
     * 处理鼠标离开事件
     */
    handleMouseLeave() {
        if (this.hoveredSquare) {
            const gridX = Math.floor(this.gridOffset.x / this.options.squareSize) * this.options.squareSize;
            const gridY = Math.floor(this.gridOffset.y / this.options.squareSize) * this.options.squareSize;
            const key = `${this.hoveredSquare.x},${this.hoveredSquare.y}`;

            this.trailSquares.set(key, {
                x: this.hoveredSquare.x * this.options.squareSize + gridX,
                y: this.hoveredSquare.y * this.options.squareSize + gridY,
                opacity: 0.6
            });
        }

        this.hoveredSquare = null;
        this.targetOpacity = 0;
    }

    /**
     * 创建特殊块
     */
    createSpecialBlock() {
        if (this.specialBlockTimer) {
            clearTimeout(this.specialBlockTimer);
        }

        const t = window.devicePixelRatio || 1;
        const canvasWidth = this.canvas.width / t;
        const canvasHeight = this.canvas.height / t;
        const gridCountX = Math.ceil(canvasWidth / this.options.squareSize);
        const gridCountY = Math.ceil(canvasHeight / this.options.squareSize);

        let e, i;
        // 确保特殊块不会出现在蛇身上
        do {
            e = 1 + Math.floor(Math.random() * (gridCountX - 2));
            i = 1 + Math.floor(Math.random() * (gridCountY - 2));
        } while (this.snakeBody.some(block => block.x === e && block.y === i));

        this.specialBlock = {
            x: e,
            y: i,
            color: this.options.specialBlockColor,
            initialOffset: { ...this.gridOffset }
        };
    }

    /**
     * 绘制网格
     */
    drawGrid() {
        const t = window.devicePixelRatio || 1;

        // 清除画布并设置变换
        this.ctx.setTransform(1, 0, 0, 1, 0, 0);
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
        this.ctx.setTransform(t, 0, 0, t, 0, 0);

        const gridX = Math.floor(this.gridOffset.x / this.options.squareSize) * this.options.squareSize;
        const gridY = Math.floor(this.gridOffset.y / this.options.squareSize) * this.options.squareSize;

        // 设置线条宽度
        this.ctx.lineWidth = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ? 1 : 0.5;
        const isPhone = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
        if (isPhone) {
            this.ctx.translate(0.5, 0.5);
        }

        // 绘制蛇身
        this.snakeBody.forEach((block, index) => {
            const c = Math.round(block.x * this.options.squareSize + gridX - this.gridOffset.x % this.options.squareSize);
            const y = Math.round(block.y * this.options.squareSize + gridY - this.gridOffset.y % this.options.squareSize);

            // 设置阴影
            this.ctx.shadowColor = this.options.hoverShadowColor;
            this.ctx.shadowBlur = 15;
            this.ctx.shadowOffsetX = 0;
            this.ctx.shadowOffsetY = 0;

            // 设置填充颜色（头部和尾部颜色渐变）
            if (index === 0) {
                this.ctx.fillStyle = this.options.snakeHeadColor;
            } else {
                const decay = Math.pow(this.options.snakeColorDecay, index);
                const headColor = this.options.snakeHeadColor.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*([.\d]+))?\)/);
                const tailColor = this.options.snakeTailColor.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*([.\d]+))?\)/);

                if (headColor && tailColor) {
                    const headR = parseInt(headColor[1]);
                    const headG = parseInt(headColor[2]);
                    const headB = parseInt(headColor[3]);
                    const headA = headColor[4] ? parseFloat(headColor[4]) : 1;

                    const tailR = parseInt(tailColor[1]);
                    const tailG = parseInt(tailColor[2]);
                    const tailB = parseInt(tailColor[3]);
                    const tailA = tailColor[4] ? parseFloat(tailColor[4]) : 1;

                    // 计算渐变颜色
                    const r = Math.round(headR + (tailR - headR) * (1 - decay));
                    const g = Math.round(headG + (tailG - headG) * (1 - decay));
                    const b = Math.round(headB + (tailB - headB) * (1 - decay));
                    const a = headA + (tailA - headA) * (1 - decay);

                    this.ctx.fillStyle = `rgba(${r}, ${g}, ${b}, ${a})`;
                } else {
                    //  fallback颜色
                    const opacity = Math.max(0.2, decay);
                    this.ctx.fillStyle = `rgba(255, 255, 255, ${opacity})`;
                }
            }

            // 绘制方块
            this.ctx.fillRect(c, y, this.options.squareSize, this.options.squareSize);

            // 清除阴影
            this.ctx.shadowColor = "transparent";
            this.ctx.shadowBlur = 0;
        });

        // 绘制网格线和特殊块
        for (let e = gridX; e < this.canvas.width + this.options.squareSize; e += this.options.squareSize) {
            for (let i = gridY; i < this.canvas.height + this.options.squareSize; i += this.options.squareSize) {
                const o = Math.round(e - this.gridOffset.x % this.options.squareSize);
                const a = Math.round(i - this.gridOffset.y % this.options.squareSize);
                const gridRow = Math.floor((e - gridX) / this.options.squareSize);
                const gridCol = Math.floor((i - gridY) / this.options.squareSize);

                // 绘制特殊块
                if (this.specialBlock && gridRow === this.specialBlock.x && gridCol === this.specialBlock.y) {
                    this.ctx.shadowColor = "rgba(255, 255, 255, 0.5)";
                    this.ctx.shadowBlur = 20;
                    this.ctx.fillStyle = this.specialBlock.color;
                    this.ctx.fillRect(o, a, this.options.squareSize, this.options.squareSize);
                    this.ctx.shadowColor = "transparent";
                    this.ctx.shadowBlur = 0;
                }

                // 绘制悬停方块
                if (this.hoveredSquare && gridRow === this.hoveredSquare.x && gridCol === this.hoveredSquare.y) {
                    this.ctx.shadowColor = this.options.hoverShadowColor;
                    this.ctx.shadowBlur = 15;
                    this.ctx.shadowOffsetX = 0;
                    this.ctx.shadowOffsetY = 0;
                    const fillColor = this.options.hoverFillColor.replace("0.6", this.currentOpacity.toString());
                    this.ctx.fillStyle = fillColor;
                    this.ctx.fillRect(o, a, this.options.squareSize, this.options.squareSize);
                    this.ctx.shadowColor = "transparent";
                    this.ctx.shadowBlur = 0;
                }

                // 绘制网格线
                this.ctx.strokeStyle = this.options.borderColor;
                this.ctx.strokeRect(o, a, this.options.squareSize, this.options.squareSize);
            }
        }

        if (isPhone) {
            this.ctx.translate(-0.5, -0.5);
        }

        // 绘制背景渐变
        const centerX = this.canvas.width / t / 2;
        const centerY = this.canvas.height / t / 2;
        const gradient = this.ctx.createRadialGradient(centerX, centerY, 0, centerX, centerY,
            Math.sqrt(Math.pow(this.canvas.width / t, 2) + Math.pow(this.canvas.height / t, 2)) / 2);
        gradient.addColorStop(0, "rgba(6, 6, 6, 0)");
        gradient.addColorStop(1, "#060606");
        this.ctx.fillStyle = gradient;
        this.ctx.fillRect(0, 0, this.canvas.width / t, this.canvas.height / t);
    }

    /**
     * 更新动画
     * @param {number} timestamp - 时间戳
     */
    updateAnimation(timestamp) {
        if (!this.lastTimestamp) {
            this.lastTimestamp = timestamp;
        }

        const deltaTime = timestamp - this.lastTimestamp;
        this.lastTimestamp = timestamp;

        // 更新透明度
        if (this.currentOpacity !== this.targetOpacity) {
            const t = Math.min(deltaTime / this.options.transitionDuration, 1);
            this.currentOpacity = this.currentOpacity + (this.targetOpacity - this.currentOpacity) * t;
        }

        // 更新轨迹方块
        for (const [key, square] of this.trailSquares.entries()) {
            square.opacity -= deltaTime / this.options.trailDuration;
            if (square.opacity <= 0) {
                this.trailSquares.delete(key);
            }
        }

        // 计算速度
        const isPhone = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
        const speed = Math.max(isPhone ? 0.8 * this.options.speed : this.options.speed, 0);
        const adjustedSpeed = isPhone ? Math.round(100 * speed) / 100 : speed;

        // 根据方向更新网格偏移
        switch (this.options.direction) {
            case "right":
                this.gridOffset.x = (this.gridOffset.x - adjustedSpeed + this.options.squareSize) % this.options.squareSize;
                break;
            case "left":
                this.gridOffset.x = (this.gridOffset.x + adjustedSpeed + this.options.squareSize) % this.options.squareSize;
                break;
            case "up":
                this.gridOffset.y = (this.gridOffset.y + adjustedSpeed + this.options.squareSize) % this.options.squareSize;
                break;
            case "down":
                this.gridOffset.y = (this.gridOffset.y - adjustedSpeed + this.options.squareSize) % this.options.squareSize;
                break;
            case "diagonal":
                this.gridOffset.x = (this.gridOffset.x - adjustedSpeed + this.options.squareSize) % this.options.squareSize;
                this.gridOffset.y = (this.gridOffset.y - adjustedSpeed + this.options.squareSize) % this.options.squareSize;
                break;
        }

        // 检查特殊块是否超出边界
        if (this.specialBlock) {
            const gridX = Math.floor(this.gridOffset.x / this.options.squareSize) * this.options.squareSize;
            const gridY = Math.floor(this.gridOffset.y / this.options.squareSize) * this.options.squareSize;
            const blockX = Math.round(this.specialBlock.x * this.options.squareSize + gridX - this.gridOffset.x % this.options.squareSize);
            const blockY = Math.round(this.specialBlock.y * this.options.squareSize + gridY - this.gridOffset.y % this.options.squareSize);
            const t = window.devicePixelRatio || 1;

            if (blockX < -this.options.squareSize || blockX > this.canvas.width / t ||
                blockY < -this.options.squareSize || blockY > this.canvas.height / t) {
                this.createSpecialBlock();
            }
        }

        // 绘制网格并请求下一帧
        this.drawGrid();
        this.animationFrame = requestAnimationFrame(timestamp => this.updateAnimation(timestamp));
    }

    /**
     * 启动动画
     */
    animate() {
        this.animationFrame = requestAnimationFrame(timestamp => this.updateAnimation(timestamp));
    }

    /**
     * 处理页面可见性变化
     */
    handleVisibilityChange() {
        const hiddenProperty = "hidden" in document ? "hidden" :
            "mozHidden" in document ? "mozHidden" :
                "webkitHidden" in document ? "webkitHidden" : "";

        if (document[hiddenProperty]) {
            if (this.animationFrame) {
                cancelAnimationFrame(this.animationFrame);
                this.animationFrame = null;
            }
        } else {
            if (!this.animationFrame) {
                this.lastTimestamp = 0;
                this.animate();
            }
        }
    }

    /**
     * 销毁动画实例，清理资源
     */
    destroy() {
        if (this.animationFrame) {
            cancelAnimationFrame(this.animationFrame);
        }

        window.removeEventListener("resize", () => this.resizeCanvas());
        this.canvas.removeEventListener("mousemove", (t) => this.handleMouseMove(t));
        this.canvas.removeEventListener("mouseleave", () => this.handleMouseLeave());

        const visibilityChangeEvent = "visibilitychange";
        document.removeEventListener(visibilityChangeEvent, this.handleVisibilityChange.bind(this));

        const isPhone = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
        if (isPhone && typeof window.orientation !== "undefined") {
            window.removeEventListener("orientationchange", () => {});
        }
    }
}
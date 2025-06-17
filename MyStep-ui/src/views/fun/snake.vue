<template>
    <div class="snake-game">
      <div class="game-board" ref="gameBoard">
        <div 
          v-for="(row, y) in board" 
          :key="y" 
          class="row"
        >
          <div 
            v-for="(cell, x) in row" 
            :key="x" 
            :class="['cell', getCellClass(cell)]"
          ></div>
        </div>
      </div>
        <div class="controls">
          <div class="score">得分: {{ score }}</div>
          <button @click="startGame" :disabled="isPlaying">开始游戏</button>
          <button @click="isPlaying ? pauseGame() : resumeGame()" :disabled="!snake.length">
            {{ isPlaying ? '暂停' : '继续' }}
          </button>
        </div>
    </div>
  </template>
  
  <script>
  const BOARD_SIZE = 30
  const SNAKE_INITIAL_LENGTH = 3
  const GAME_SPEED = 200
  
  export default {
    name: 'SnakeGame',
    data() {
      return {
        board: [],
        snake: [],
        food: null,
        direction: 'right',
        isPlaying: false,
        gameInterval: null,
        score: 0,
        speedMultiplier: 1, // 添加速度倍增器
      }
    },
    mounted() {
      this.initBoard()
      window.addEventListener('keydown', this.handleKeyPress)
    },
    beforeDestroy() {
      window.removeEventListener('keydown', this.handleKeyPress)
      this.clearGameInterval()
    },
    methods: {
      initBoard() {
        this.board = Array(BOARD_SIZE).fill().map(() => Array(BOARD_SIZE).fill(0))
      },
      startGame() {
        this.initBoard()
        this.score = 0
        this.direction = 'right'
        this.initSnake()
        this.generateFood()
        this.isPlaying = true
        this.gameInterval = setInterval(this.gameLoop, GAME_SPEED)
      },
      pauseGame() {
        this.isPlaying = false
        this.clearGameInterval()
      },
       // 添加继续游戏的方法
    resumeGame() {
      if (this.snake.length > 0) {  // 确保游戏已经初始化
        this.isPlaying = true
        this.gameInterval = setInterval(this.gameLoop, GAME_SPEED)
      }
    },
      clearGameInterval() {
        if (this.gameInterval) {
          clearInterval(this.gameInterval)
          this.gameInterval = null
        }
      },
      initSnake() {
        this.snake = []
        const startX = Math.floor(BOARD_SIZE / 2)
        const startY = Math.floor(BOARD_SIZE / 2)
        for (let i = 0; i < SNAKE_INITIAL_LENGTH; i++) {
        this.snake.push({ x: startX - i, y: startY })
        }
        this.updateBoard()
      },
      generateFood() {
        while (true) {
          const x = Math.floor(Math.random() * BOARD_SIZE)
          const y = Math.floor(Math.random() * BOARD_SIZE)
          if (this.board[y][x] === 0) {
            this.food = { x, y }
            this.board[y][x] = 2
            break
          }
        }
      },
      updateBoard() {
        this.initBoard()
        this.snake.forEach((segment, index) => {
          if (segment.y >= 0 && segment.y < BOARD_SIZE && segment.x >= 0 && segment.x < BOARD_SIZE) {
            this.board[segment.y][segment.x] = 1
          }
        })
        if (this.food) {
          this.board[this.food.y][this.food.x] = 2
        }
      },
      gameLoop() {
        const head = { ...this.snake[0] }
        switch (this.direction) {
          case 'up': head.y--; break
          case 'down': head.y++; break
          case 'left': head.x--; break
          case 'right': head.x++; break
        }
  
        if (this.checkCollision(head)) {
          this.gameOver()
          return
        }
  
        this.snake.unshift(head)
        if (head.x === this.food.x && head.y === this.food.y) {
          this.score += 10
          this.generateFood()
        } else {
          this.snake.pop()
        }
        this.updateBoard()
      },
      checkCollision(head) {
         // 检查是否撞墙
        if (head.x < 0 || head.x >= BOARD_SIZE || head.y < 0 || head.y >= BOARD_SIZE) {
        return true
        }
        // 检查是否撞到自己（从第二个身体段开始检查，避免误判头部）
        return this.snake.slice(1).some(segment => segment.x === head.x && segment.y === head.y)
    
      },
      gameOver() {
        alert(`游戏结束！得分：${this.score}`)
        this.pauseGame()
        this.resetGame() // 添加重置游戏的方法
      },
      resetGame() {
          this.score = 0
          this.direction = 'right'
          this.snake = []
          this.food = null
          this.initBoard() // 重新初始化游戏板
      },
      handleKeyPress(event) {
        if (!this.isPlaying) return
        
        const keyMap = {
        'ArrowUp': 'up',
        'ArrowDown': 'down',
        'ArrowLeft': 'left',
        'ArrowRight': 'right',
        '0': 'speedUp' // 添加0键的映射
        }
        
        const newDirection = keyMap[event.key]
        if (!newDirection) return

        // 阻止方向键的默认滚动行为
        event.preventDefault()

        const opposites = {
        'up': 'down',
        'down': 'up',
        'left': 'right',
        'right': 'left'
        }

        if (newDirection === 'speedUp') {
        this.speedMultiplier = 2; // 按住0键时加快速度
        this.clearGameInterval(); // 清除当前的游戏间隔
        this.gameInterval = setInterval(this.gameLoop, GAME_SPEED / this.speedMultiplier); // 重新设置游戏间隔
        } else {
        if (opposites[newDirection] !== this.direction) {
            this.direction = newDirection
        }
        }
      },
      getCellClass(cell) {
        if (cell === 1) return 'snake'
        if (cell === 2) return 'food'
        return ''
      }
    }
  }
  </script>
  
  <style scoped>
  .snake-game {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
  }
  
  .game-board {
    border: 2px solid #333;
    background-color: #f0f0f0;
  }
  
  .row {
    display: flex;
  }
  
  .cell {
    width: 20px;
    height: 20px;
    border: 1px solid #ddd;
  }
  
  .snake {
    background-color: #4CAF50;
  }
  
  .food {
    background-color: #f44336;
    border-radius: 50%;
  }
  
  .controls {
    margin-top: 20px;
    display: flex;
    gap: 10px;
    align-items: center;
  }
  
  button {
    padding: 8px 16px;
    background-color: #2196F3;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  
  button:disabled {
    background-color: #ccc;
    cursor: not-allowed;
  }
  
  .score {
    font-size: 1.2em;
    font-weight: bold;
    margin-right: 20px;
  }
  </style>
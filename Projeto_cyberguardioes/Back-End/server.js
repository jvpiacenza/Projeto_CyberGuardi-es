const express = require('express')
const cors = require('cors')
const mysql = require('mysql2/promise')
const porta = 3000
const server = express()
server.use(cors())
server.use(express.json())
const pool = require("./db.js") 

const crypto = require('crypto')
const res = require('express/lib/response')
const req = require('express/lib/request')
const { resourceLimits } = require('worker_threads')

server.listen(porta,() =>{
    console.log("Servidor rodando")
})


//fazer login na intranet
server.post("/login_intranet", async (req,res)=>{
    try {
        const{email} = req.body
        let {senha} = req.body

        senha = senha.trim()

        if(email == ""){
            return res.json(
                {"resposta":"Preencha um email"})
        }else if(email.length < 8){
            return res.json(
                {"resposta":"Email maior que 8"})
        }else if(senha == ""){
            return res.json(
                {"resposta":"Preencha uma senha"})
        }else if(senha.length < 6){
            return res.json(
                {"resposta":"Senha maior que 6"})
        }

        const hash = crypto.createHash("sha256").update(senha).digest("hex")
        const sql = `select * from login_intranet where email = ? and senha = ?`
        const [resultado] = await pool.query(sql,[email,hash])

        if(resultado.length > 0) {
            return res.json(
                {"resposta":"Você acertou o login e senha"})
        }else{
            return res.json(
                {"resposta":"Email ou senha inválida"})
        }
    } catch (error) {
        console.log(error)
    }
})

//cadastrar
server.post("/cadastrar_intranet", async (req,res)=>{
    try {
        const {nome,email} = req.body
        let {senha} = req.body

        senha = senha.trim()

        if(nome==""){
            return res.json(
                {"resposta":"Preencha um nome"})
        }else if(email == ""){
            return res.json(
                {"resposta":"Preencha um email"})
        }else if(email.length < 8){
            return res.json(
                {"resposta":"Email precisa ser maior que 8"})
        }else if(senha == ""){
            return res.json (
                {"resposta":"Preencha uma senha"})
        }else if(senha.length < 6){
            return res.json (
                {"resposta":"Senha precisa ser maior que 6"})
        }

        let sql = `select * from login_intranet where email = ?`
        let [verificar] = await pool.query(sql,[email])

        if(verificar.length != 0){
            return res.json(
                {"resposta":"Email ja cadastrado/existe"})
        }

        const hash = crypto.createHash("sha256").update(senha).digest("hex")

        sql = `insert into login_intranet (nome,email,senha) values (?,?,?)`
        let [resultado] = await pool.query(sql,[nome,email,hash])

        if(resultado.affectedRows == 1){
            return res.json(
                {"resposta":"Cadastro efeutuado com sucesso!"})
        }else{
            return res.json(
                {"resposta":"Erro ao fazer cadastro!"})
        }
    } catch (error) {
        console.log(error)
        return res.status(500).json({ resposta: "Erro interno no servidor" })
    }
})

//fale conosco
server.post("/fale_conosco", async(req,res)=>{
    try {
        const {nome,email,telefone,assunto,mensagem} = req.body

        if(email == ""){
            return res.json(
                {"resposta": "Preencha um e-mail"})
        }else if(email.length < 8){
            return res.json(
                {"resposta": "Preencha um e-mail com mais de 8 caracteres"})
        } else if(nome.length < 8){
            return res.json(
                {"resposta": "Preencha um nome com mais de 8 caracteres"})
        } else if(assunto == ""){
            return res.json(
                {"resposta":"Preencha um assunto"})
        } else if(mensagem == ""){
            return res.json(
                {"resposta":"Preencha uma mensagem"})
        }

        let sql = `insert into fale_conosco (nome,email,telefone,assunto,mensagem) values (?,?,?,?,?)`
        let [resultado] = await pool.query(sql,[nome,email,telefone,assunto,mensagem])

        if(resultado.affectedRows == 1){
            return res.json(
                {"resposta": "Mensagem enviada!"})
        } else{
            return res.json(
                {"resposta":"Erro ao enviar a mensagem!"})
        }

    } catch (error) {
        console.log(error)
    }
})
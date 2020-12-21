/** @jsx jsx */
import { jsx } from "@emotion/core"
import * as styles from "../../styles/components/AuthPage.js"
import * as formStyles from "../../styles/Form.js"
import { useState, useContext, useEffect } from "react"
import { useRouter } from "next/router"
import { UserContext } from "../_app"
import AuthPage from "../../components/AuthPage"
import axios from "axios"
import Button from "../../components/utils/Button.js"

export default function SignUp() {
    const router = useRouter()
    const { signIn } = useContext(UserContext)
    const [username, setUsername] = useState("")
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [passwordConfirm, setPasswordConfirm] = useState("")

    useEffect(() => {
        router.prefetch("/auth/login")
    })

    const handleUsernameChange = (event) => {
        setUsername(event.target.value)
    }

    const handleEmailChange = (event) => {
        setEmail(event.target.value)
    }

    const handlePasswordChange = (event) => {
        setPassword(event.target.value)
    }

    const handlePasswordConfirmChange = (event) => {
        setPasswordConfirm(event.target.value)
    }

    const handleSignUp = async (event) => {
        event.preventDefault()
        try {
            const res = await axios.post("/api/signUp", {
                username: username,
                email: email,
                password: password,
                passwordConfirm: passwordConfirm,
            })
            if (res.data.token) {
                signIn(res.data.token, res.data.username, res.data.email)
            }
        } catch (e) {
            //TODO handle error
            console.log(e)
        }
    }

    return (
        <AuthPage title="Sign Up">
            <form className="flex flex-col items-center justify-center">
                <div className="relative mb-7">
                    <input
                        type="text"
                        value={username}
                        onChange={handleUsernameChange}
                        css={formStyles.input}
                        required
                    />
                    <span css={formStyles.highlight}></span>
                    <span css={formStyles.bar}></span>
                    <label css={formStyles.label}>Username</label>
                </div>

                <div className="relative mb-7">
                    <input
                        type="email"
                        value={email}
                        onChange={handleEmailChange}
                        css={formStyles.input}
                        required
                    />
                    <span css={formStyles.highlight}></span>
                    <span css={formStyles.bar}></span>
                    <label css={formStyles.label}>Email</label>
                </div>

                <div className="relative mb-7">
                    <input
                        type="password"
                        value={password}
                        onChange={handlePasswordChange}
                        css={formStyles.input}
                        required
                    />
                    <span css={formStyles.highlight}></span>
                    <span css={formStyles.bar}></span>
                    <label css={formStyles.label}>Password</label>
                </div>

                <div className="relative mb-7">
                    <input
                        type="password"
                        value={passwordConfirm}
                        onChange={handlePasswordConfirmChange}
                        css={formStyles.input}
                        required
                    />
                    <span css={formStyles.highlight}></span>
                    <span css={formStyles.bar}></span>
                    <label css={formStyles.label}>Password (again)</label>
                </div>

                <Button isFullWidth={true} onClick={handleSignUp}>
                    Sign Up
                </Button>

                <div className="flex flex-col justify-center p-8">
                    <p className="block mb-2">Already have an account?</p>
                    <a
                        onClick={() => router.push("/auth/login", "/login")}
                        className="text-blue-primary-200 underline text-xl text-center cursor-pointer hover:bg-blue-primary-300"
                    >
                        Login!
                    </a>
                </div>
            </form>
        </AuthPage>
    )
}

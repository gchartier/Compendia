import PropTypes from "prop-types"

const PullListIcon = ({ isActive }) => (
    <div className="pr-2">
        {isActive ? (
            <svg width="24px" height="24px" viewBox="0 0 24 24">
                <g id="Symbols" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
                    <g id="pullListIcon">
                        <polygon id="Path" points="0 0 24 0 24 24 0 24"></polygon>
                        <path
                            d="M18,13 L17.32,13 L15.32,15 L17.23,15 L19,17 L5,17 L6.78,15 L8.83,15 L6.83,13 L6,13 L3,16 L3,20 C3,21.1 3.89,22 4.99,22 L19,22 C20.1,22 21,21.11 21,20 L21,16 L18,13 Z M17,7.95 L12.05,12.9 L8.51,9.36 L13.46,4.41 L17,7.95 Z M12.76,2.29 L6.39,8.66 C6,9.05 6,9.68 6.39,10.07 L11.34,15.02 C11.73,15.41 12.36,15.41 12.75,15.02 L19.11,8.66 C19.5,8.27 19.5,7.64 19.11,7.25 L14.16,2.3 C13.78,1.9 13.15,1.9 12.76,2.29 Z"
                            id="Shape"
                            fill="#FFFFFF"
                            fillRule="nonzero"
                        ></path>
                    </g>
                </g>
            </svg>
        ) : (
            <svg width="24px" height="24px" viewBox="0 0 24 24">
                <g id="Symbols" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
                    <g id="pullListIcon">
                        <polygon id="Path" points="0 0 24 0 24 24 0 24"></polygon>
                        <path
                            d="M18,13 L17.32,13 L15.32,15 L17.23,15 L19,17 L5,17 L6.78,15 L8.83,15 L6.83,13 L6,13 L3,16 L3,20 C3,21.1 3.89,22 4.99,22 L19,22 C20.1,22 21,21.11 21,20 L21,16 L18,13 Z M17,7.95 L12.05,12.9 L8.51,9.36 L13.46,4.41 L17,7.95 Z M12.76,2.29 L6.39,8.66 C6,9.05 6,9.68 6.39,10.07 L11.34,15.02 C11.73,15.41 12.36,15.41 12.75,15.02 L19.11,8.66 C19.5,8.27 19.5,7.64 19.11,7.25 L14.16,2.3 C13.78,1.9 13.15,1.9 12.76,2.29 Z"
                            id="Shape"
                            fill="#6B7280"
                            fillRule="nonzero"
                        ></path>
                    </g>
                </g>
            </svg>
        )}
    </div>
)

PullListIcon.propTypes = {
    isActive: PropTypes.bool,
}

export default PullListIcon

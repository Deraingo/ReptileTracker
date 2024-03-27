import { Link, Outlet } from "react-router-dom";
import { useSelector } from "react-redux";

function App() {
  const authToken = useSelector(state => state.application.authToken)
  return (
    
    <div className="container">
      <div className="header">
        <nav className="my-nav">{
        !authToken && (
          <>
            <div className="buttons">
              <Link className="action-button" to="/sign_up">Create Account </Link>
              <Link className="action-button" to="/login">Sign In</Link>
            </div>
          </>
        )
        }</nav>
      </div>
      <div className="main-body">
        <h2 className="reptile-header">Really Cool Reptiles</h2>
        <p>
          A really cool application that allows you to track the needs of your favorite reptiles
        </p>
        <Outlet />
      </div>

      <div className="footer"></div>
    </div>
  );
}

export default App

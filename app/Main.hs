import Application () -- for YesodDispatch instance
import Foundation
import Yesod.Core
import System.Environment

main :: IO ()
main = do
  maybePort <- lookupEnv "PORT"
  let port =
        case maybePort of
          Nothing -> 5000
          Just portStr -> read portStr :: Int
  warp port App

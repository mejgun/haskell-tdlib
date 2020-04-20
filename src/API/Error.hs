-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Error where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Error = 
 Error { message :: String, code :: Int }  -- deriving (Show)

instance T.ToJSON Error where
 toJSON (Error { message = message, code = code }) =
  A.object [ "@type" A..= T.String "error", "message" A..= message, "code" A..= code ]
-- error Error  { message :: String, code :: Int } 


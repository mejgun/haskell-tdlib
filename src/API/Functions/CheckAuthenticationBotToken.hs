-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckAuthenticationBotToken where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckAuthenticationBotToken = 
 CheckAuthenticationBotToken { token :: String }  -- deriving (Show)

instance T.ToJSON CheckAuthenticationBotToken where
 toJSON (CheckAuthenticationBotToken { token = token }) =
  A.object [ "@type" A..= T.String "checkAuthenticationBotToken", "token" A..= token ]
-- checkAuthenticationBotToken CheckAuthenticationBotToken  { token :: String } 


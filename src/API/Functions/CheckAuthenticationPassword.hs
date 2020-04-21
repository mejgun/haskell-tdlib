-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckAuthenticationPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckAuthenticationPassword = 
 CheckAuthenticationPassword { password :: String }  deriving (Show)

instance T.ToJSON CheckAuthenticationPassword where
 toJSON (CheckAuthenticationPassword { password = password }) =
  A.object [ "@type" A..= T.String "checkAuthenticationPassword", "password" A..= password ]



instance T.FromJSON CheckAuthenticationPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkAuthenticationPassword" -> parseCheckAuthenticationPassword v

   _ -> mempty ""
  where
   parseCheckAuthenticationPassword :: A.Value -> T.Parser CheckAuthenticationPassword
   parseCheckAuthenticationPassword = A.withObject "CheckAuthenticationPassword" $ \o -> do
    password <- o A..: "password"
    return $ CheckAuthenticationPassword { password = password }
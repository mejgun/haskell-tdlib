-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RecoverAuthenticationPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RecoverAuthenticationPassword = 
 RecoverAuthenticationPassword { recovery_code :: String }  deriving (Show)

instance T.ToJSON RecoverAuthenticationPassword where
 toJSON (RecoverAuthenticationPassword { recovery_code = recovery_code }) =
  A.object [ "@type" A..= T.String "recoverAuthenticationPassword", "recovery_code" A..= recovery_code ]



instance T.FromJSON RecoverAuthenticationPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "recoverAuthenticationPassword" -> parseRecoverAuthenticationPassword v

   _ -> mempty ""
  where
   parseRecoverAuthenticationPassword :: A.Value -> T.Parser RecoverAuthenticationPassword
   parseRecoverAuthenticationPassword = A.withObject "RecoverAuthenticationPassword" $ \o -> do
    recovery_code <- o A..: "recovery_code"
    return $ RecoverAuthenticationPassword { recovery_code = recovery_code }
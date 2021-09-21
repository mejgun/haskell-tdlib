-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RecoverAuthenticationPassword where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Recovers the password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
-- 
-- __recovery_code__ Recovery code to check
-- 
-- __new_password__ New password of the user; may be empty to remove the password
-- 
-- __new_hint__ New password hint; may be empty
data RecoverAuthenticationPassword = 

 RecoverAuthenticationPassword { new_hint :: Maybe String, new_password :: Maybe String, recovery_code :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON RecoverAuthenticationPassword where
 toJSON (RecoverAuthenticationPassword { new_hint = new_hint, new_password = new_password, recovery_code = recovery_code }) =
  A.object [ "@type" A..= T.String "recoverAuthenticationPassword", "new_hint" A..= new_hint, "new_password" A..= new_password, "recovery_code" A..= recovery_code ]

instance T.FromJSON RecoverAuthenticationPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "recoverAuthenticationPassword" -> parseRecoverAuthenticationPassword v
   _ -> mempty
  where
   parseRecoverAuthenticationPassword :: A.Value -> T.Parser RecoverAuthenticationPassword
   parseRecoverAuthenticationPassword = A.withObject "RecoverAuthenticationPassword" $ \o -> do
    new_hint <- o A..:? "new_hint"
    new_password <- o A..:? "new_password"
    recovery_code <- o A..:? "recovery_code"
    return $ RecoverAuthenticationPassword { new_hint = new_hint, new_password = new_password, recovery_code = recovery_code }
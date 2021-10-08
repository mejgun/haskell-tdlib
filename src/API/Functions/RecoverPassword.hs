-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RecoverPassword where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Recovers the 2-step verification password using a recovery code sent to an email address that was previously set up
-- 
-- __recovery_code__ Recovery code to check
-- 
-- __new_password__ New password of the user; may be empty to remove the password
-- 
-- __new_hint__ New password hint; may be empty
data RecoverPassword = 

 RecoverPassword { new_hint :: Maybe String, new_password :: Maybe String, recovery_code :: Maybe String }  deriving (Eq)

instance Show RecoverPassword where
 show RecoverPassword { new_hint=new_hint, new_password=new_password, recovery_code=recovery_code } =
  "RecoverPassword" ++ cc [p "new_hint" new_hint, p "new_password" new_password, p "recovery_code" recovery_code ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON RecoverPassword where
 toJSON RecoverPassword { new_hint = new_hint, new_password = new_password, recovery_code = recovery_code } =
  A.object [ "@type" A..= T.String "recoverPassword", "new_hint" A..= new_hint, "new_password" A..= new_password, "recovery_code" A..= recovery_code ]

instance T.FromJSON RecoverPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "recoverPassword" -> parseRecoverPassword v
   _ -> mempty
  where
   parseRecoverPassword :: A.Value -> T.Parser RecoverPassword
   parseRecoverPassword = A.withObject "RecoverPassword" $ \o -> do
    new_hint <- o A..:? "new_hint"
    new_password <- o A..:? "new_password"
    recovery_code <- o A..:? "recovery_code"
    return $ RecoverPassword { new_hint = new_hint, new_password = new_password, recovery_code = recovery_code }
 parseJSON _ = mempty

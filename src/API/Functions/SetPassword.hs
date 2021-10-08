-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPassword where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Changes the password for the current user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed
-- 
-- __old_password__ Previous password of the user
-- 
-- __new_password__ New password of the user; may be empty to remove the password
-- 
-- __new_hint__ New password hint; may be empty
-- 
-- __set_recovery_email_address__ Pass true if the recovery email address must be changed
-- 
-- __new_recovery_email_address__ New recovery email address; may be empty
data SetPassword = 

 SetPassword { new_recovery_email_address :: Maybe String, set_recovery_email_address :: Maybe Bool, new_hint :: Maybe String, new_password :: Maybe String, old_password :: Maybe String }  deriving (Eq)

instance Show SetPassword where
 show SetPassword { new_recovery_email_address=new_recovery_email_address, set_recovery_email_address=set_recovery_email_address, new_hint=new_hint, new_password=new_password, old_password=old_password } =
  "SetPassword" ++ cc [p "new_recovery_email_address" new_recovery_email_address, p "set_recovery_email_address" set_recovery_email_address, p "new_hint" new_hint, p "new_password" new_password, p "old_password" old_password ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetPassword where
 toJSON SetPassword { new_recovery_email_address = new_recovery_email_address, set_recovery_email_address = set_recovery_email_address, new_hint = new_hint, new_password = new_password, old_password = old_password } =
  A.object [ "@type" A..= T.String "setPassword", "new_recovery_email_address" A..= new_recovery_email_address, "set_recovery_email_address" A..= set_recovery_email_address, "new_hint" A..= new_hint, "new_password" A..= new_password, "old_password" A..= old_password ]

instance T.FromJSON SetPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setPassword" -> parseSetPassword v
   _ -> mempty
  where
   parseSetPassword :: A.Value -> T.Parser SetPassword
   parseSetPassword = A.withObject "SetPassword" $ \o -> do
    new_recovery_email_address <- o A..:? "new_recovery_email_address"
    set_recovery_email_address <- o A..:? "set_recovery_email_address"
    new_hint <- o A..:? "new_hint"
    new_password <- o A..:? "new_password"
    old_password <- o A..:? "old_password"
    return $ SetPassword { new_recovery_email_address = new_recovery_email_address, set_recovery_email_address = set_recovery_email_address, new_hint = new_hint, new_password = new_password, old_password = old_password }
 parseJSON _ = mempty

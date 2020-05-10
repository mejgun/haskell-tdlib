-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RecoverPassword where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Recovers the password using a recovery code sent to an email address that was previously set up 
-- 
-- __recovery_code__ Recovery code to check
data RecoverPassword = 

 RecoverPassword { recovery_code :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON RecoverPassword where
 toJSON (RecoverPassword { recovery_code = recovery_code }) =
  A.object [ "@type" A..= T.String "recoverPassword", "recovery_code" A..= recovery_code ]

instance T.FromJSON RecoverPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "recoverPassword" -> parseRecoverPassword v
   _ -> mempty
  where
   parseRecoverPassword :: A.Value -> T.Parser RecoverPassword
   parseRecoverPassword = A.withObject "RecoverPassword" $ \o -> do
    recovery_code <- o A..:? "recovery_code"
    return $ RecoverPassword { recovery_code = recovery_code }
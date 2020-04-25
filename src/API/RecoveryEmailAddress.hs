-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.RecoveryEmailAddress where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data RecoveryEmailAddress = 
 RecoveryEmailAddress { recovery_email_address :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON RecoveryEmailAddress where
 toJSON (RecoveryEmailAddress { recovery_email_address = recovery_email_address }) =
  A.object [ "@type" A..= T.String "recoveryEmailAddress", "recovery_email_address" A..= recovery_email_address ]

instance T.FromJSON RecoveryEmailAddress where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "recoveryEmailAddress" -> parseRecoveryEmailAddress v
   _ -> mempty
  where
   parseRecoveryEmailAddress :: A.Value -> T.Parser RecoveryEmailAddress
   parseRecoveryEmailAddress = A.withObject "RecoveryEmailAddress" $ \o -> do
    recovery_email_address <- o A..:? "recovery_email_address"
    return $ RecoveryEmailAddress { recovery_email_address = recovery_email_address }
-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecoveryEmailAddress where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetRecoveryEmailAddress = 
 GetRecoveryEmailAddress { password :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetRecoveryEmailAddress where
 toJSON (GetRecoveryEmailAddress { password = password }) =
  A.object [ "@type" A..= T.String "getRecoveryEmailAddress", "password" A..= password ]

instance T.FromJSON GetRecoveryEmailAddress where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecoveryEmailAddress" -> parseGetRecoveryEmailAddress v
   _ -> mempty
  where
   parseGetRecoveryEmailAddress :: A.Value -> T.Parser GetRecoveryEmailAddress
   parseGetRecoveryEmailAddress = A.withObject "GetRecoveryEmailAddress" $ \o -> do
    password <- optional $ o A..: "password"
    return $ GetRecoveryEmailAddress { password = password }
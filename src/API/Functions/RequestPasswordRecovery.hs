-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RequestPasswordRecovery where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Requests to send a password recovery code to an email address that was previously set up
data RequestPasswordRecovery = 

 RequestPasswordRecovery deriving (Show, Eq)

instance T.ToJSON RequestPasswordRecovery where
 toJSON (RequestPasswordRecovery {  }) =
  A.object [ "@type" A..= T.String "requestPasswordRecovery" ]

instance T.FromJSON RequestPasswordRecovery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "requestPasswordRecovery" -> parseRequestPasswordRecovery v
   _ -> mempty
  where
   parseRequestPasswordRecovery :: A.Value -> T.Parser RequestPasswordRecovery
   parseRequestPasswordRecovery = A.withObject "RequestPasswordRecovery" $ \o -> do
    return $ RequestPasswordRecovery {  }
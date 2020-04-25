-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RequestAuthenticationPasswordRecovery where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data RequestAuthenticationPasswordRecovery = 
 RequestAuthenticationPasswordRecovery deriving (Show, Eq)

instance T.ToJSON RequestAuthenticationPasswordRecovery where
 toJSON (RequestAuthenticationPasswordRecovery {  }) =
  A.object [ "@type" A..= T.String "requestAuthenticationPasswordRecovery" ]

instance T.FromJSON RequestAuthenticationPasswordRecovery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "requestAuthenticationPasswordRecovery" -> parseRequestAuthenticationPasswordRecovery v
   _ -> mempty
  where
   parseRequestAuthenticationPasswordRecovery :: A.Value -> T.Parser RequestAuthenticationPasswordRecovery
   parseRequestAuthenticationPasswordRecovery = A.withObject "RequestAuthenticationPasswordRecovery" $ \o -> do
    return $ RequestAuthenticationPasswordRecovery {  }
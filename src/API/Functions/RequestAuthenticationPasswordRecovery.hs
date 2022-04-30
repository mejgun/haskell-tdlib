-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RequestAuthenticationPasswordRecovery where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Requests to send a password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
data RequestAuthenticationPasswordRecovery = 

 RequestAuthenticationPasswordRecovery deriving (Eq)

instance Show RequestAuthenticationPasswordRecovery where
 show RequestAuthenticationPasswordRecovery {  } =
  "RequestAuthenticationPasswordRecovery" ++ U.cc [ ]

instance T.ToJSON RequestAuthenticationPasswordRecovery where
 toJSON RequestAuthenticationPasswordRecovery {  } =
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
 parseJSON _ = mempty

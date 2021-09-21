-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetPassword where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Removes 2-step verification password without previous password and access to recovery email address. The password can't be reset immediately and the request needs to be repeated after the specified time
data ResetPassword = 

 ResetPassword deriving (Show, Eq)

instance T.ToJSON ResetPassword where
 toJSON (ResetPassword {  }) =
  A.object [ "@type" A..= T.String "resetPassword" ]

instance T.FromJSON ResetPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resetPassword" -> parseResetPassword v
   _ -> mempty
  where
   parseResetPassword :: A.Value -> T.Parser ResetPassword
   parseResetPassword = A.withObject "ResetPassword" $ \o -> do
    return $ ResetPassword {  }
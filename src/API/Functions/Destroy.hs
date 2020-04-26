-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.Destroy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Closes the TDLib instance, destroying all local data without a proper logout. The current user session will remain in the list of all active sessions. All local data will be destroyed. After the destruction completes updateAuthorizationState with authorizationStateClosed will be sent
data Destroy = 
 Destroy deriving (Show, Eq)

instance T.ToJSON Destroy where
 toJSON (Destroy {  }) =
  A.object [ "@type" A..= T.String "destroy" ]

instance T.FromJSON Destroy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "destroy" -> parseDestroy v
   _ -> mempty
  where
   parseDestroy :: A.Value -> T.Parser Destroy
   parseDestroy = A.withObject "Destroy" $ \o -> do
    return $ Destroy {  }
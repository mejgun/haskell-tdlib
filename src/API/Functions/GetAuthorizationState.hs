-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAuthorizationState where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetAuthorizationState = 
 GetAuthorizationState deriving (Show)

instance T.ToJSON GetAuthorizationState where
 toJSON (GetAuthorizationState {  }) =
  A.object [ "@type" A..= T.String "getAuthorizationState" ]

instance T.FromJSON GetAuthorizationState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAuthorizationState" -> parseGetAuthorizationState v
   _ -> mempty
  where
   parseGetAuthorizationState :: A.Value -> T.Parser GetAuthorizationState
   parseGetAuthorizationState = A.withObject "GetAuthorizationState" $ \o -> do
    return $ GetAuthorizationState {  }
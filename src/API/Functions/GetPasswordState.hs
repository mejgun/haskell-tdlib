-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPasswordState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetPasswordState = 
 GetPasswordState deriving (Show, Eq)

instance T.ToJSON GetPasswordState where
 toJSON (GetPasswordState {  }) =
  A.object [ "@type" A..= T.String "getPasswordState" ]

instance T.FromJSON GetPasswordState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPasswordState" -> parseGetPasswordState v
   _ -> mempty
  where
   parseGetPasswordState :: A.Value -> T.Parser GetPasswordState
   parseGetPasswordState = A.withObject "GetPasswordState" $ \o -> do
    return $ GetPasswordState {  }
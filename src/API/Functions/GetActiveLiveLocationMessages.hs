-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetActiveLiveLocationMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetActiveLiveLocationMessages = 
 GetActiveLiveLocationMessages deriving (Show, Eq)

instance T.ToJSON GetActiveLiveLocationMessages where
 toJSON (GetActiveLiveLocationMessages {  }) =
  A.object [ "@type" A..= T.String "getActiveLiveLocationMessages" ]

instance T.FromJSON GetActiveLiveLocationMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getActiveLiveLocationMessages" -> parseGetActiveLiveLocationMessages v
   _ -> mempty
  where
   parseGetActiveLiveLocationMessages :: A.Value -> T.Parser GetActiveLiveLocationMessages
   parseGetActiveLiveLocationMessages = A.withObject "GetActiveLiveLocationMessages" $ \o -> do
    return $ GetActiveLiveLocationMessages {  }
-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPushReceiverId where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetPushReceiverId = 
 GetPushReceiverId { payload :: Maybe String }  deriving (Show)

instance T.ToJSON GetPushReceiverId where
 toJSON (GetPushReceiverId { payload = payload }) =
  A.object [ "@type" A..= T.String "getPushReceiverId", "payload" A..= payload ]

instance T.FromJSON GetPushReceiverId where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPushReceiverId" -> parseGetPushReceiverId v
   _ -> mempty
  where
   parseGetPushReceiverId :: A.Value -> T.Parser GetPushReceiverId
   parseGetPushReceiverId = A.withObject "GetPushReceiverId" $ \o -> do
    payload <- optional $ o A..: "payload"
    return $ GetPushReceiverId { payload = payload }
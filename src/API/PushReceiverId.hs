-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PushReceiverId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data PushReceiverId = 
 PushReceiverId { _id :: Int }  deriving (Show)

instance T.ToJSON PushReceiverId where
 toJSON (PushReceiverId { _id = _id }) =
  A.object [ "@type" A..= T.String "pushReceiverId", "id" A..= _id ]

instance T.FromJSON PushReceiverId where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pushReceiverId" -> parsePushReceiverId v
   _ -> mempty
  where
   parsePushReceiverId :: A.Value -> T.Parser PushReceiverId
   parsePushReceiverId = A.withObject "PushReceiverId" $ \o -> do
    _id <- o A..: "id"
    return $ PushReceiverId { _id = _id }
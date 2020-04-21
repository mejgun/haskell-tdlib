-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CallId = 
 CallId { _id :: Int }  deriving (Show)

instance T.ToJSON CallId where
 toJSON (CallId { _id = _id }) =
  A.object [ "@type" A..= T.String "callId", "id" A..= _id ]

instance T.FromJSON CallId where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callId" -> parseCallId v
   _ -> mempty
  where
   parseCallId :: A.Value -> T.Parser CallId
   parseCallId = A.withObject "CallId" $ \o -> do
    _id <- o A..: "id"
    return $ CallId { _id = _id }
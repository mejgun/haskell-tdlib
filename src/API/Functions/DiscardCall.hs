-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DiscardCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DiscardCall = 
 DiscardCall { connection_id :: Int, duration :: Int, is_disconnected :: Bool, call_id :: Int }  deriving (Show)

instance T.ToJSON DiscardCall where
 toJSON (DiscardCall { connection_id = connection_id, duration = duration, is_disconnected = is_disconnected, call_id = call_id }) =
  A.object [ "@type" A..= T.String "discardCall", "connection_id" A..= connection_id, "duration" A..= duration, "is_disconnected" A..= is_disconnected, "call_id" A..= call_id ]

instance T.FromJSON DiscardCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "discardCall" -> parseDiscardCall v
   _ -> mempty
  where
   parseDiscardCall :: A.Value -> T.Parser DiscardCall
   parseDiscardCall = A.withObject "DiscardCall" $ \o -> do
    connection_id <- o A..: "connection_id"
    duration <- o A..: "duration"
    is_disconnected <- o A..: "is_disconnected"
    call_id <- o A..: "call_id"
    return $ DiscardCall { connection_id = connection_id, duration = duration, is_disconnected = is_disconnected, call_id = call_id }
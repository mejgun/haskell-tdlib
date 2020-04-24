-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DiscardCall where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DiscardCall = 
 DiscardCall { connection_id :: Maybe Int, duration :: Maybe Int, is_disconnected :: Maybe Bool, call_id :: Maybe Int }  deriving (Show, Eq)

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
    connection_id <- optional $ o A..: "connection_id"
    duration <- optional $ o A..: "duration"
    is_disconnected <- optional $ o A..: "is_disconnected"
    call_id <- optional $ o A..: "call_id"
    return $ DiscardCall { connection_id = connection_id, duration = duration, is_disconnected = is_disconnected, call_id = call_id }
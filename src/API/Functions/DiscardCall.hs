-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DiscardCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Discards a call 
-- 
-- __call_id__ Call identifier
-- 
-- __is_disconnected__ True, if the user was disconnected
-- 
-- __duration__ The call duration, in seconds
-- 
-- __connection_id__ Identifier of the connection used during the call
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
    connection_id <- mconcat [ o A..:? "connection_id", readMaybe <$> (o A..: "connection_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_disconnected <- o A..:? "is_disconnected"
    call_id <- mconcat [ o A..:? "call_id", readMaybe <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DiscardCall { connection_id = connection_id, duration = duration, is_disconnected = is_disconnected, call_id = call_id }
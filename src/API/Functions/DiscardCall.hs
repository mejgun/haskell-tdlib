-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DiscardCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Discards a call 
-- 
-- __call_id__ Call identifier
-- 
-- __is_disconnected__ Pass true if the user was disconnected
-- 
-- __duration__ The call duration, in seconds
-- 
-- __is_video__ Pass true if the call was a video call
-- 
-- __connection_id__ Identifier of the connection used during the call
data DiscardCall = 

 DiscardCall { connection_id :: Maybe Int, is_video :: Maybe Bool, duration :: Maybe Int, is_disconnected :: Maybe Bool, call_id :: Maybe Int }  deriving (Eq)

instance Show DiscardCall where
 show DiscardCall { connection_id=connection_id, is_video=is_video, duration=duration, is_disconnected=is_disconnected, call_id=call_id } =
  "DiscardCall" ++ cc [p "connection_id" connection_id, p "is_video" is_video, p "duration" duration, p "is_disconnected" is_disconnected, p "call_id" call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DiscardCall where
 toJSON DiscardCall { connection_id = connection_id, is_video = is_video, duration = duration, is_disconnected = is_disconnected, call_id = call_id } =
  A.object [ "@type" A..= T.String "discardCall", "connection_id" A..= connection_id, "is_video" A..= is_video, "duration" A..= duration, "is_disconnected" A..= is_disconnected, "call_id" A..= call_id ]

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
    is_video <- o A..:? "is_video"
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_disconnected <- o A..:? "is_disconnected"
    call_id <- mconcat [ o A..:? "call_id", readMaybe <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DiscardCall { connection_id = connection_id, is_video = is_video, duration = duration, is_disconnected = is_disconnected, call_id = call_id }
 parseJSON _ = mempty

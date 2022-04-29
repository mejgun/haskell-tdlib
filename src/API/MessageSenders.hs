-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageSenders where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Represents a list of message senders 
-- 
-- __total_count__ Approximate total number of messages senders found
-- 
-- __senders__ List of message senders
data MessageSenders = 

 MessageSenders { senders :: Maybe [MessageSender.MessageSender], total_count :: Maybe Int }  deriving (Eq)

instance Show MessageSenders where
 show MessageSenders { senders=senders, total_count=total_count } =
  "MessageSenders" ++ cc [p "senders" senders, p "total_count" total_count ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON MessageSenders where
 toJSON MessageSenders { senders = senders, total_count = total_count } =
  A.object [ "@type" A..= T.String "messageSenders", "senders" A..= senders, "total_count" A..= total_count ]

instance T.FromJSON MessageSenders where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageSenders" -> parseMessageSenders v
   _ -> mempty
  where
   parseMessageSenders :: A.Value -> T.Parser MessageSenders
   parseMessageSenders = A.withObject "MessageSenders" $ \o -> do
    senders <- o A..:? "senders"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageSenders { senders = senders, total_count = total_count }
 parseJSON _ = mempty

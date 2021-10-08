-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageSchedulingState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains information about the time when a scheduled message will be sent
data MessageSchedulingState = 
 -- |
 -- 
 -- The message will be sent at the specified date 
 -- 
 -- __send_date__ Date the message will be sent. The date must be within 367 days in the future
 MessageSchedulingStateSendAtDate { send_date :: Maybe Int }  |
 -- |
 -- 
 -- The message will be sent when the peer will be online. Applicable to private chats only and when the exact online status of the peer is known
 MessageSchedulingStateSendWhenOnline deriving (Eq)

instance Show MessageSchedulingState where
 show MessageSchedulingStateSendAtDate { send_date=send_date } =
  "MessageSchedulingStateSendAtDate" ++ cc [p "send_date" send_date ]

 show MessageSchedulingStateSendWhenOnline {  } =
  "MessageSchedulingStateSendWhenOnline" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON MessageSchedulingState where
 toJSON MessageSchedulingStateSendAtDate { send_date = send_date } =
  A.object [ "@type" A..= T.String "messageSchedulingStateSendAtDate", "send_date" A..= send_date ]

 toJSON MessageSchedulingStateSendWhenOnline {  } =
  A.object [ "@type" A..= T.String "messageSchedulingStateSendWhenOnline" ]

instance T.FromJSON MessageSchedulingState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageSchedulingStateSendAtDate" -> parseMessageSchedulingStateSendAtDate v
   "messageSchedulingStateSendWhenOnline" -> parseMessageSchedulingStateSendWhenOnline v
   _ -> mempty
  where
   parseMessageSchedulingStateSendAtDate :: A.Value -> T.Parser MessageSchedulingState
   parseMessageSchedulingStateSendAtDate = A.withObject "MessageSchedulingStateSendAtDate" $ \o -> do
    send_date <- mconcat [ o A..:? "send_date", readMaybe <$> (o A..: "send_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageSchedulingStateSendAtDate { send_date = send_date }

   parseMessageSchedulingStateSendWhenOnline :: A.Value -> T.Parser MessageSchedulingState
   parseMessageSchedulingStateSendWhenOnline = A.withObject "MessageSchedulingStateSendWhenOnline" $ \o -> do
    return $ MessageSchedulingStateSendWhenOnline {  }
 parseJSON _ = mempty

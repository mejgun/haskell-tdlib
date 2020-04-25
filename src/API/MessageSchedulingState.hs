-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageSchedulingState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data MessageSchedulingState = 
 MessageSchedulingStateSendAtDate { send_date :: Maybe Int }  
 | MessageSchedulingStateSendWhenOnline deriving (Show, Eq)

instance T.ToJSON MessageSchedulingState where
 toJSON (MessageSchedulingStateSendAtDate { send_date = send_date }) =
  A.object [ "@type" A..= T.String "messageSchedulingStateSendAtDate", "send_date" A..= send_date ]

 toJSON (MessageSchedulingStateSendWhenOnline {  }) =
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
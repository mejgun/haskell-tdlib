{-# LANGUAGE OverloadedStrings #-}

module TD.Data.MessageCalendarDay where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Message as Message
import qualified Utils as U

data MessageCalendarDay = -- | Contains information about found messages sent on a specific day @total_count Total number of found messages sent on the day @message First message sent on the day
  MessageCalendarDay
  { -- |
    message :: Maybe Message.Message,
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show MessageCalendarDay where
  show
    MessageCalendarDay
      { message = message,
        total_count = total_count
      } =
      "MessageCalendarDay"
        ++ U.cc
          [ U.p "message" message,
            U.p "total_count" total_count
          ]

instance T.FromJSON MessageCalendarDay where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageCalendarDay" -> parseMessageCalendarDay v
      _ -> mempty
    where
      parseMessageCalendarDay :: A.Value -> T.Parser MessageCalendarDay
      parseMessageCalendarDay = A.withObject "MessageCalendarDay" $ \o -> do
        message_ <- o A..:? "message"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ MessageCalendarDay {message = message_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON MessageCalendarDay where
  toJSON
    MessageCalendarDay
      { message = message,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "messageCalendarDay",
          "message" A..= message,
          "total_count" A..= total_count
        ]

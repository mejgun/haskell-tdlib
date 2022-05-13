{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Notification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.NotificationType as NotificationType
import qualified Utils as U

data Notification = -- | Contains information about a notification @id Unique persistent identifier of this notification @date Notification date
  Notification
  { -- |
    _type :: Maybe NotificationType.NotificationType,
    -- | True, if the notification was explicitly sent without sound @type Notification type
    is_silent :: Maybe Bool,
    -- |
    date :: Maybe Int,
    -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Notification where
  show
    Notification
      { _type = _type_,
        is_silent = is_silent_,
        date = date_,
        _id = _id_
      } =
      "Notification"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "is_silent" is_silent_,
            U.p "date" date_,
            U.p "_id" _id_
          ]

instance T.FromJSON Notification where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "notification" -> parseNotification v
      _ -> mempty
    where
      parseNotification :: A.Value -> T.Parser Notification
      parseNotification = A.withObject "Notification" $ \o -> do
        _type_ <- o A..:? "type"
        is_silent_ <- o A..:? "is_silent"
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Notification {_type = _type_, is_silent = is_silent_, date = date_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Notification where
  toJSON
    Notification
      { _type = _type_,
        is_silent = is_silent_,
        date = date_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "notification",
          "type" A..= _type_,
          "is_silent" A..= is_silent_,
          "date" A..= date_,
          "id" A..= _id_
        ]

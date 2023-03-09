{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageViewer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data MessageViewer = -- | Represents a viewer of a message @user_id User identifier of the viewer @view_date Approximate point in time (Unix timestamp) when the message was viewed
  MessageViewer
  { -- |
    view_date :: Maybe Int,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show MessageViewer where
  show
    MessageViewer
      { view_date = view_date_,
        user_id = user_id_
      } =
      "MessageViewer"
        ++ U.cc
          [ U.p "view_date" view_date_,
            U.p "user_id" user_id_
          ]

instance T.FromJSON MessageViewer where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageViewer" -> parseMessageViewer v
      _ -> mempty
    where
      parseMessageViewer :: A.Value -> T.Parser MessageViewer
      parseMessageViewer = A.withObject "MessageViewer" $ \o -> do
        view_date_ <- o A..:? "view_date"
        user_id_ <- o A..:? "user_id"
        return $ MessageViewer {view_date = view_date_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON MessageViewer where
  toJSON
    MessageViewer
      { view_date = view_date_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "messageViewer",
          "view_date" A..= view_date_,
          "user_id" A..= user_id_
        ]

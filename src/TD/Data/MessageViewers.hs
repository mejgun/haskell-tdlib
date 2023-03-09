{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageViewers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageViewer as MessageViewer
import qualified Utils as U

-- |
data MessageViewers = -- | Represents a list of message viewers @viewers List of message viewers
  MessageViewers
  { -- |
    viewers :: Maybe [MessageViewer.MessageViewer]
  }
  deriving (Eq)

instance Show MessageViewers where
  show
    MessageViewers
      { viewers = viewers_
      } =
      "MessageViewers"
        ++ U.cc
          [ U.p "viewers" viewers_
          ]

instance T.FromJSON MessageViewers where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageViewers" -> parseMessageViewers v
      _ -> mempty
    where
      parseMessageViewers :: A.Value -> T.Parser MessageViewers
      parseMessageViewers = A.withObject "MessageViewers" $ \o -> do
        viewers_ <- o A..:? "viewers"
        return $ MessageViewers {viewers = viewers_}
  parseJSON _ = mempty

instance T.ToJSON MessageViewers where
  toJSON
    MessageViewers
      { viewers = viewers_
      } =
      A.object
        [ "@type" A..= T.String "messageViewers",
          "viewers" A..= viewers_
        ]

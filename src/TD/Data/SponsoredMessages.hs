{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.SponsoredMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.SponsoredMessage as SponsoredMessage
import qualified Utils as U

-- |
data SponsoredMessages = -- | Contains a list of sponsored messages @messages List of sponsored messages @messages_between The minimum number of messages between shown sponsored messages, or 0 if only one sponsored message must be shown after all ordinary messages
  SponsoredMessages
  { -- |
    messages_between :: Maybe Int,
    -- |
    messages :: Maybe [SponsoredMessage.SponsoredMessage]
  }
  deriving (Eq)

instance Show SponsoredMessages where
  show
    SponsoredMessages
      { messages_between = messages_between_,
        messages = messages_
      } =
      "SponsoredMessages"
        ++ U.cc
          [ U.p "messages_between" messages_between_,
            U.p "messages" messages_
          ]

instance T.FromJSON SponsoredMessages where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "sponsoredMessages" -> parseSponsoredMessages v
      _ -> mempty
    where
      parseSponsoredMessages :: A.Value -> T.Parser SponsoredMessages
      parseSponsoredMessages = A.withObject "SponsoredMessages" $ \o -> do
        messages_between_ <- o A..:? "messages_between"
        messages_ <- o A..:? "messages"
        return $ SponsoredMessages {messages_between = messages_between_, messages = messages_}
  parseJSON _ = mempty

instance T.ToJSON SponsoredMessages where
  toJSON
    SponsoredMessages
      { messages_between = messages_between_,
        messages = messages_
      } =
      A.object
        [ "@type" A..= T.String "sponsoredMessages",
          "messages_between" A..= messages_between_,
          "messages" A..= messages_
        ]

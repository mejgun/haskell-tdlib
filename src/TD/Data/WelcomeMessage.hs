module TD.Data.WelcomeMessage
  (WelcomeMessage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageContent as MessageContent

data WelcomeMessage
  = WelcomeMessage -- ^ Describes a set up welcome message
    { _id     :: Maybe Int                           -- ^ Welcome message identifier; unique for the chat to which the welcome message belongs
    , content :: Maybe MessageContent.MessageContent -- ^ Content of the welcome message
    }
  deriving (Eq, Show)

instance I.ShortShow WelcomeMessage where
  shortShow WelcomeMessage
    { _id     = _id_
    , content = content_
    }
      = "WelcomeMessage"
        ++ I.cc
        [ "_id"     `I.p` _id_
        , "content" `I.p` content_
        ]

instance AT.FromJSON WelcomeMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "welcomeMessage" -> parseWelcomeMessage v
      _                -> mempty
    
    where
      parseWelcomeMessage :: A.Value -> AT.Parser WelcomeMessage
      parseWelcomeMessage = A.withObject "WelcomeMessage" $ \o -> do
        _id_     <- o A..:?  "id"
        content_ <- o A..:?  "content"
        pure $ WelcomeMessage
          { _id     = _id_
          , content = content_
          }
  parseJSON _ = mempty


module TD.Data.TargetChat
  (TargetChat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TargetChatTypes as TargetChatTypes
import {-# SOURCE #-} qualified TD.Data.InternalLinkType as InternalLinkType

-- | Describes the target chat to be opened
data TargetChat
  = TargetChatCurrent -- ^ The currently opened chat and forum topic must be kept
  | TargetChatChosen -- ^ The chat needs to be chosen by the user among chats of the specified types
    { types :: Maybe TargetChatTypes.TargetChatTypes -- ^ Allowed types for the chat
    }
  | TargetChatInternalLink -- ^ The chat needs to be open with the provided internal link
    { link :: Maybe InternalLinkType.InternalLinkType -- ^ An internal link pointing to the chat
    }
  deriving (Eq, Show)

instance I.ShortShow TargetChat where
  shortShow TargetChatCurrent
      = "TargetChatCurrent"
  shortShow TargetChatChosen
    { types = types_
    }
      = "TargetChatChosen"
        ++ I.cc
        [ "types" `I.p` types_
        ]
  shortShow TargetChatInternalLink
    { link = link_
    }
      = "TargetChatInternalLink"
        ++ I.cc
        [ "link" `I.p` link_
        ]

instance AT.FromJSON TargetChat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "targetChatCurrent"      -> pure TargetChatCurrent
      "targetChatChosen"       -> parseTargetChatChosen v
      "targetChatInternalLink" -> parseTargetChatInternalLink v
      _                        -> mempty
    
    where
      parseTargetChatChosen :: A.Value -> AT.Parser TargetChat
      parseTargetChatChosen = A.withObject "TargetChatChosen" $ \o -> do
        types_ <- o A..:?  "types"
        pure $ TargetChatChosen
          { types = types_
          }
      parseTargetChatInternalLink :: A.Value -> AT.Parser TargetChat
      parseTargetChatInternalLink = A.withObject "TargetChatInternalLink" $ \o -> do
        link_ <- o A..:?  "link"
        pure $ TargetChatInternalLink
          { link = link_
          }
  parseJSON _ = mempty

instance AT.ToJSON TargetChat where
  toJSON TargetChatCurrent
      = A.object
        [ "@type" A..= AT.String "targetChatCurrent"
        ]
  toJSON TargetChatChosen
    { types = types_
    }
      = A.object
        [ "@type" A..= AT.String "targetChatChosen"
        , "types" A..= types_
        ]
  toJSON TargetChatInternalLink
    { link = link_
    }
      = A.object
        [ "@type" A..= AT.String "targetChatInternalLink"
        , "link"  A..= link_
        ]


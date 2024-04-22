module TD.Data.InputBusinessChatLink
  ( InputBusinessChatLink(..)    
  , defaultInputBusinessChatLink 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified Data.Text as T

data InputBusinessChatLink
  = InputBusinessChatLink -- ^ Describes a business chat link to create or edit
    { text  :: Maybe FormattedText.FormattedText -- ^ Message draft text that will be added to the input field
    , title :: Maybe T.Text                      -- ^ Link title
    }
  deriving (Eq, Show)

instance I.ShortShow InputBusinessChatLink where
  shortShow InputBusinessChatLink
    { text  = text_
    , title = title_
    }
      = "InputBusinessChatLink"
        ++ I.cc
        [ "text"  `I.p` text_
        , "title" `I.p` title_
        ]

instance AT.FromJSON InputBusinessChatLink where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputBusinessChatLink" -> parseInputBusinessChatLink v
      _                       -> mempty
    
    where
      parseInputBusinessChatLink :: A.Value -> AT.Parser InputBusinessChatLink
      parseInputBusinessChatLink = A.withObject "InputBusinessChatLink" $ \o -> do
        text_  <- o A..:?  "text"
        title_ <- o A..:?  "title"
        pure $ InputBusinessChatLink
          { text  = text_
          , title = title_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputBusinessChatLink where
  toJSON InputBusinessChatLink
    { text  = text_
    , title = title_
    }
      = A.object
        [ "@type" A..= AT.String "inputBusinessChatLink"
        , "text"  A..= text_
        , "title" A..= title_
        ]

defaultInputBusinessChatLink :: InputBusinessChatLink
defaultInputBusinessChatLink =
  InputBusinessChatLink
    { text  = Nothing
    , title = Nothing
    }


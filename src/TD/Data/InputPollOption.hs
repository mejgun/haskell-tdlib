module TD.Data.InputPollOption
  ( InputPollOption(..)    
  , defaultInputPollOption 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data InputPollOption
  = InputPollOption -- ^ Describes one answer option of a poll to be created
    { text :: Maybe FormattedText.FormattedText -- ^ Option text; 1-100 characters. Only custom emoji entities are allowed to be added and only by Premium users
    }
  deriving (Eq, Show)

instance I.ShortShow InputPollOption where
  shortShow InputPollOption
    { text = text_
    }
      = "InputPollOption"
        ++ I.cc
        [ "text" `I.p` text_
        ]

instance AT.FromJSON InputPollOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPollOption" -> parseInputPollOption v
      _                 -> mempty
    
    where
      parseInputPollOption :: A.Value -> AT.Parser InputPollOption
      parseInputPollOption = A.withObject "InputPollOption" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ InputPollOption
          { text = text_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPollOption where
  toJSON InputPollOption
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "inputPollOption"
        , "text"  A..= text_
        ]

defaultInputPollOption :: InputPollOption
defaultInputPollOption =
  InputPollOption
    { text = Nothing
    }


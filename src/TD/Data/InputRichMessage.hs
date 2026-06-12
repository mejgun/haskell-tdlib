module TD.Data.InputRichMessage
  ( InputRichMessage(..)    
  , defaultInputRichMessage 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.RichMessageSource as RichMessageSource

data InputRichMessage
  = InputRichMessage -- ^ A rich message to send
    { source                  :: Maybe RichMessageSource.RichMessageSource -- ^ Source of the rich message
    , is_rtl                  :: Maybe Bool                                -- ^ Pass true if the message must be shown from right to left
    , detect_automatic_blocks :: Maybe Bool                                -- ^ Pass true to enable detection of URLs, email addresses and other automatic blocks
    }
  deriving (Eq, Show)

instance I.ShortShow InputRichMessage where
  shortShow InputRichMessage
    { source                  = source_
    , is_rtl                  = is_rtl_
    , detect_automatic_blocks = detect_automatic_blocks_
    }
      = "InputRichMessage"
        ++ I.cc
        [ "source"                  `I.p` source_
        , "is_rtl"                  `I.p` is_rtl_
        , "detect_automatic_blocks" `I.p` detect_automatic_blocks_
        ]

instance AT.FromJSON InputRichMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputRichMessage" -> parseInputRichMessage v
      _                  -> mempty
    
    where
      parseInputRichMessage :: A.Value -> AT.Parser InputRichMessage
      parseInputRichMessage = A.withObject "InputRichMessage" $ \o -> do
        source_                  <- o A..:?  "source"
        is_rtl_                  <- o A..:?  "is_rtl"
        detect_automatic_blocks_ <- o A..:?  "detect_automatic_blocks"
        pure $ InputRichMessage
          { source                  = source_
          , is_rtl                  = is_rtl_
          , detect_automatic_blocks = detect_automatic_blocks_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputRichMessage where
  toJSON InputRichMessage
    { source                  = source_
    , is_rtl                  = is_rtl_
    , detect_automatic_blocks = detect_automatic_blocks_
    }
      = A.object
        [ "@type"                   A..= AT.String "inputRichMessage"
        , "source"                  A..= source_
        , "is_rtl"                  A..= is_rtl_
        , "detect_automatic_blocks" A..= detect_automatic_blocks_
        ]

defaultInputRichMessage :: InputRichMessage
defaultInputRichMessage =
  InputRichMessage
    { source                  = Nothing
    , is_rtl                  = Nothing
    , detect_automatic_blocks = Nothing
    }


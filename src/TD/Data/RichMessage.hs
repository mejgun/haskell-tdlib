module TD.Data.RichMessage
  ( RichMessage(..)    
  , defaultRichMessage 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PageBlock as PageBlock

data RichMessage
  = RichMessage -- ^ Describes a message with rich formatting
    { blocks  :: Maybe [PageBlock.PageBlock] -- ^ Content of the message
    , is_rtl  :: Maybe Bool                  -- ^ True, if the message must be shown from right to left
    , is_full :: Maybe Bool                  -- ^ True, if the object contains the full message. Otherwise, getFullRichMessage must be used to get the full message
    }
  deriving (Eq, Show)

instance I.ShortShow RichMessage where
  shortShow RichMessage
    { blocks  = blocks_
    , is_rtl  = is_rtl_
    , is_full = is_full_
    }
      = "RichMessage"
        ++ I.cc
        [ "blocks"  `I.p` blocks_
        , "is_rtl"  `I.p` is_rtl_
        , "is_full" `I.p` is_full_
        ]

instance AT.FromJSON RichMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "richMessage" -> parseRichMessage v
      _             -> mempty
    
    where
      parseRichMessage :: A.Value -> AT.Parser RichMessage
      parseRichMessage = A.withObject "RichMessage" $ \o -> do
        blocks_  <- o A..:?  "blocks"
        is_rtl_  <- o A..:?  "is_rtl"
        is_full_ <- o A..:?  "is_full"
        pure $ RichMessage
          { blocks  = blocks_
          , is_rtl  = is_rtl_
          , is_full = is_full_
          }
  parseJSON _ = mempty

instance AT.ToJSON RichMessage where
  toJSON RichMessage
    { blocks  = blocks_
    , is_rtl  = is_rtl_
    , is_full = is_full_
    }
      = A.object
        [ "@type"   A..= AT.String "richMessage"
        , "blocks"  A..= blocks_
        , "is_rtl"  A..= is_rtl_
        , "is_full" A..= is_full_
        ]

defaultRichMessage :: RichMessage
defaultRichMessage =
  RichMessage
    { blocks  = Nothing
    , is_rtl  = Nothing
    , is_full = Nothing
    }


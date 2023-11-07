module TD.Data.LinkPreviewOptions
  ( LinkPreviewOptions(..)    
  , defaultLinkPreviewOptions 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data LinkPreviewOptions
  = LinkPreviewOptions -- ^ Options to be used for generation of a link preview
    { is_disabled       :: Maybe Bool   -- ^ True, if link preview must be disabled
    , url               :: Maybe T.Text -- ^ URL to use for link preview. If empty, then the first URL found in the message text will be used
    , force_small_media :: Maybe Bool   -- ^ True, if shown media preview must be small; ignored in secret chats or if the URL isn't explicitly specified
    , force_large_media :: Maybe Bool   -- ^ True, if shown media preview must be large; ignored in secret chats or if the URL isn't explicitly specified
    , show_above_text   :: Maybe Bool   -- ^ True, if link preview must be shown above message text; otherwise, the link preview will be shown below the message text; ignored in secret chats
    }
  deriving (Eq, Show)

instance I.ShortShow LinkPreviewOptions where
  shortShow LinkPreviewOptions
    { is_disabled       = is_disabled_
    , url               = url_
    , force_small_media = force_small_media_
    , force_large_media = force_large_media_
    , show_above_text   = show_above_text_
    }
      = "LinkPreviewOptions"
        ++ I.cc
        [ "is_disabled"       `I.p` is_disabled_
        , "url"               `I.p` url_
        , "force_small_media" `I.p` force_small_media_
        , "force_large_media" `I.p` force_large_media_
        , "show_above_text"   `I.p` show_above_text_
        ]

instance AT.FromJSON LinkPreviewOptions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "linkPreviewOptions" -> parseLinkPreviewOptions v
      _                    -> mempty
    
    where
      parseLinkPreviewOptions :: A.Value -> AT.Parser LinkPreviewOptions
      parseLinkPreviewOptions = A.withObject "LinkPreviewOptions" $ \o -> do
        is_disabled_       <- o A..:?  "is_disabled"
        url_               <- o A..:?  "url"
        force_small_media_ <- o A..:?  "force_small_media"
        force_large_media_ <- o A..:?  "force_large_media"
        show_above_text_   <- o A..:?  "show_above_text"
        pure $ LinkPreviewOptions
          { is_disabled       = is_disabled_
          , url               = url_
          , force_small_media = force_small_media_
          , force_large_media = force_large_media_
          , show_above_text   = show_above_text_
          }
  parseJSON _ = mempty

instance AT.ToJSON LinkPreviewOptions where
  toJSON LinkPreviewOptions
    { is_disabled       = is_disabled_
    , url               = url_
    , force_small_media = force_small_media_
    , force_large_media = force_large_media_
    , show_above_text   = show_above_text_
    }
      = A.object
        [ "@type"             A..= AT.String "linkPreviewOptions"
        , "is_disabled"       A..= is_disabled_
        , "url"               A..= url_
        , "force_small_media" A..= force_small_media_
        , "force_large_media" A..= force_large_media_
        , "show_above_text"   A..= show_above_text_
        ]

defaultLinkPreviewOptions :: LinkPreviewOptions
defaultLinkPreviewOptions =
  LinkPreviewOptions
    { is_disabled       = Nothing
    , url               = Nothing
    , force_small_media = Nothing
    , force_large_media = Nothing
    , show_above_text   = Nothing
    }


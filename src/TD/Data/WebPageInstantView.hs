module TD.Data.WebPageInstantView
  ( WebPageInstantView(..)    
  , defaultWebPageInstantView 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PageBlock as PageBlock
import qualified TD.Data.InternalLinkType as InternalLinkType

data WebPageInstantView
  = WebPageInstantView -- ^ Describes an instant view page for a web page
    { page_blocks   :: Maybe [PageBlock.PageBlock]             -- ^ Content of the web page
    , view_count    :: Maybe Int                               -- ^ Number of the instant view views; 0 if unknown
    , version       :: Maybe Int                               -- ^ Version of the instant view; currently, can be 1 or 2
    , is_rtl        :: Maybe Bool                              -- ^ True, if the instant view must be shown from right to left
    , is_full       :: Maybe Bool                              -- ^ True, if the instant view contains the full page. A network request might be needed to get the full web page instant view
    , feedback_link :: Maybe InternalLinkType.InternalLinkType -- ^ An internal link to be opened to leave feedback about the instant view
    }
  deriving (Eq)

instance Show WebPageInstantView where
  show WebPageInstantView
    { page_blocks   = page_blocks_
    , view_count    = view_count_
    , version       = version_
    , is_rtl        = is_rtl_
    , is_full       = is_full_
    , feedback_link = feedback_link_
    }
      = "WebPageInstantView"
        ++ I.cc
        [ "page_blocks"   `I.p` page_blocks_
        , "view_count"    `I.p` view_count_
        , "version"       `I.p` version_
        , "is_rtl"        `I.p` is_rtl_
        , "is_full"       `I.p` is_full_
        , "feedback_link" `I.p` feedback_link_
        ]

instance AT.FromJSON WebPageInstantView where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webPageInstantView" -> parseWebPageInstantView v
      _                    -> mempty
    
    where
      parseWebPageInstantView :: A.Value -> AT.Parser WebPageInstantView
      parseWebPageInstantView = A.withObject "WebPageInstantView" $ \o -> do
        page_blocks_   <- o A..:?  "page_blocks"
        view_count_    <- o A..:?  "view_count"
        version_       <- o A..:?  "version"
        is_rtl_        <- o A..:?  "is_rtl"
        is_full_       <- o A..:?  "is_full"
        feedback_link_ <- o A..:?  "feedback_link"
        pure $ WebPageInstantView
          { page_blocks   = page_blocks_
          , view_count    = view_count_
          , version       = version_
          , is_rtl        = is_rtl_
          , is_full       = is_full_
          , feedback_link = feedback_link_
          }
  parseJSON _ = mempty

instance AT.ToJSON WebPageInstantView where
  toJSON WebPageInstantView
    { page_blocks   = page_blocks_
    , view_count    = view_count_
    , version       = version_
    , is_rtl        = is_rtl_
    , is_full       = is_full_
    , feedback_link = feedback_link_
    }
      = A.object
        [ "@type"         A..= AT.String "webPageInstantView"
        , "page_blocks"   A..= page_blocks_
        , "view_count"    A..= view_count_
        , "version"       A..= version_
        , "is_rtl"        A..= is_rtl_
        , "is_full"       A..= is_full_
        , "feedback_link" A..= feedback_link_
        ]

defaultWebPageInstantView :: WebPageInstantView
defaultWebPageInstantView =
  WebPageInstantView
    { page_blocks   = Nothing
    , view_count    = Nothing
    , version       = Nothing
    , is_rtl        = Nothing
    , is_full       = Nothing
    , feedback_link = Nothing
    }


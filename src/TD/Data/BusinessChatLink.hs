module TD.Data.BusinessChatLink
  (BusinessChatLink(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FormattedText as FormattedText

data BusinessChatLink
  = BusinessChatLink -- ^ Contains information about a business chat link
    { link       :: Maybe T.Text                      -- ^ The HTTPS link
    , text       :: Maybe FormattedText.FormattedText -- ^ Message draft text that will be added to the input field
    , title      :: Maybe T.Text                      -- ^ Link title
    , view_count :: Maybe Int                         -- ^ Number of times the link was used
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessChatLink where
  shortShow BusinessChatLink
    { link       = link_
    , text       = text_
    , title      = title_
    , view_count = view_count_
    }
      = "BusinessChatLink"
        ++ I.cc
        [ "link"       `I.p` link_
        , "text"       `I.p` text_
        , "title"      `I.p` title_
        , "view_count" `I.p` view_count_
        ]

instance AT.FromJSON BusinessChatLink where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessChatLink" -> parseBusinessChatLink v
      _                  -> mempty
    
    where
      parseBusinessChatLink :: A.Value -> AT.Parser BusinessChatLink
      parseBusinessChatLink = A.withObject "BusinessChatLink" $ \o -> do
        link_       <- o A..:?  "link"
        text_       <- o A..:?  "text"
        title_      <- o A..:?  "title"
        view_count_ <- o A..:?  "view_count"
        pure $ BusinessChatLink
          { link       = link_
          , text       = text_
          , title      = title_
          , view_count = view_count_
          }
  parseJSON _ = mempty


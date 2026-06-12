module TD.Data.WebDomainException
  (WebDomainException(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data WebDomainException
  = WebDomainException -- ^ Describes an exception for built-in browser usage
    { url                     :: Maybe T.Text -- ^ URL for which the exception is done
    , domain                  :: Maybe T.Text -- ^ Domain of the URL. All URLs on the domain and subdomains of the domain are subject to the exception
    , title                   :: Maybe T.Text -- ^ Title of the website
    , favicon_custom_emoji_id :: Maybe Int    -- ^ Identifier of the custom emoji with favicon of the website; may be 0 if unknown, in which case the first letter of the domain must be used
    }
  deriving (Eq, Show)

instance I.ShortShow WebDomainException where
  shortShow WebDomainException
    { url                     = url_
    , domain                  = domain_
    , title                   = title_
    , favicon_custom_emoji_id = favicon_custom_emoji_id_
    }
      = "WebDomainException"
        ++ I.cc
        [ "url"                     `I.p` url_
        , "domain"                  `I.p` domain_
        , "title"                   `I.p` title_
        , "favicon_custom_emoji_id" `I.p` favicon_custom_emoji_id_
        ]

instance AT.FromJSON WebDomainException where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webDomainException" -> parseWebDomainException v
      _                    -> mempty
    
    where
      parseWebDomainException :: A.Value -> AT.Parser WebDomainException
      parseWebDomainException = A.withObject "WebDomainException" $ \o -> do
        url_                     <- o A..:?                       "url"
        domain_                  <- o A..:?                       "domain"
        title_                   <- o A..:?                       "title"
        favicon_custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "favicon_custom_emoji_id"
        pure $ WebDomainException
          { url                     = url_
          , domain                  = domain_
          , title                   = title_
          , favicon_custom_emoji_id = favicon_custom_emoji_id_
          }
  parseJSON _ = mempty


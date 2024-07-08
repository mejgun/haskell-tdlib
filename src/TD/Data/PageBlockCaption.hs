module TD.Data.PageBlockCaption
  (PageBlockCaption(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.RichText as RichText

data PageBlockCaption
  = PageBlockCaption -- ^ Contains a caption of another block
    { text   :: Maybe RichText.RichText -- ^ Content of the caption
    , credit :: Maybe RichText.RichText -- ^ Block credit (like HTML tag <cite>)
    }
  deriving (Eq, Show)

instance I.ShortShow PageBlockCaption where
  shortShow PageBlockCaption
    { text   = text_
    , credit = credit_
    }
      = "PageBlockCaption"
        ++ I.cc
        [ "text"   `I.p` text_
        , "credit" `I.p` credit_
        ]

instance AT.FromJSON PageBlockCaption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pageBlockCaption" -> parsePageBlockCaption v
      _                  -> mempty
    
    where
      parsePageBlockCaption :: A.Value -> AT.Parser PageBlockCaption
      parsePageBlockCaption = A.withObject "PageBlockCaption" $ \o -> do
        text_   <- o A..:?  "text"
        credit_ <- o A..:?  "credit"
        pure $ PageBlockCaption
          { text   = text_
          , credit = credit_
          }
  parseJSON _ = mempty


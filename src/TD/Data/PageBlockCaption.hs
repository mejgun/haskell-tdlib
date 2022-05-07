{-# LANGUAGE OverloadedStrings #-}

module TD.Data.PageBlockCaption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.RichText as RichText
import qualified Utils as U

data PageBlockCaption = -- | Contains a caption of an instant view web page block, consisting of a text and a trailing credit @text Content of the caption @credit Block credit (like HTML tag <cite>)
  PageBlockCaption
  { -- |
    credit :: Maybe RichText.RichText,
    -- |
    text :: Maybe RichText.RichText
  }
  deriving (Eq)

instance Show PageBlockCaption where
  show
    PageBlockCaption
      { credit = credit,
        text = text
      } =
      "PageBlockCaption"
        ++ U.cc
          [ U.p "credit" credit,
            U.p "text" text
          ]

instance T.FromJSON PageBlockCaption where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pageBlockCaption" -> parsePageBlockCaption v
      _ -> mempty
    where
      parsePageBlockCaption :: A.Value -> T.Parser PageBlockCaption
      parsePageBlockCaption = A.withObject "PageBlockCaption" $ \o -> do
        credit_ <- o A..:? "credit"
        text_ <- o A..:? "text"
        return $ PageBlockCaption {credit = credit_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON PageBlockCaption where
  toJSON
    PageBlockCaption
      { credit = credit,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "pageBlockCaption",
          "credit" A..= credit,
          "text" A..= text
        ]

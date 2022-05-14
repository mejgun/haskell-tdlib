{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.WebPageInstantView where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InternalLinkType as InternalLinkType
import qualified TD.Data.PageBlock as PageBlock
import qualified Utils as U

-- |
data WebPageInstantView = -- | Describes an instant view page for a web page
  WebPageInstantView
  { -- | An internal link to be opened to leave feedback about the instant view
    feedback_link :: Maybe InternalLinkType.InternalLinkType,
    -- | True, if the instant view contains the full page. A network request might be needed to get the full web page instant view
    is_full :: Maybe Bool,
    -- | True, if the instant view must be shown from right to left
    is_rtl :: Maybe Bool,
    -- | Version of the instant view; currently, can be 1 or 2
    version :: Maybe Int,
    -- | Number of the instant view views; 0 if unknown
    view_count :: Maybe Int,
    -- | Content of the web page
    page_blocks :: Maybe [PageBlock.PageBlock]
  }
  deriving (Eq)

instance Show WebPageInstantView where
  show
    WebPageInstantView
      { feedback_link = feedback_link_,
        is_full = is_full_,
        is_rtl = is_rtl_,
        version = version_,
        view_count = view_count_,
        page_blocks = page_blocks_
      } =
      "WebPageInstantView"
        ++ U.cc
          [ U.p "feedback_link" feedback_link_,
            U.p "is_full" is_full_,
            U.p "is_rtl" is_rtl_,
            U.p "version" version_,
            U.p "view_count" view_count_,
            U.p "page_blocks" page_blocks_
          ]

instance T.FromJSON WebPageInstantView where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "webPageInstantView" -> parseWebPageInstantView v
      _ -> mempty
    where
      parseWebPageInstantView :: A.Value -> T.Parser WebPageInstantView
      parseWebPageInstantView = A.withObject "WebPageInstantView" $ \o -> do
        feedback_link_ <- o A..:? "feedback_link"
        is_full_ <- o A..:? "is_full"
        is_rtl_ <- o A..:? "is_rtl"
        version_ <- mconcat [o A..:? "version", U.rm <$> (o A..: "version" :: T.Parser String)] :: T.Parser (Maybe Int)
        view_count_ <- mconcat [o A..:? "view_count", U.rm <$> (o A..: "view_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        page_blocks_ <- o A..:? "page_blocks"
        return $ WebPageInstantView {feedback_link = feedback_link_, is_full = is_full_, is_rtl = is_rtl_, version = version_, view_count = view_count_, page_blocks = page_blocks_}
  parseJSON _ = mempty

instance T.ToJSON WebPageInstantView where
  toJSON
    WebPageInstantView
      { feedback_link = feedback_link_,
        is_full = is_full_,
        is_rtl = is_rtl_,
        version = version_,
        view_count = view_count_,
        page_blocks = page_blocks_
      } =
      A.object
        [ "@type" A..= T.String "webPageInstantView",
          "feedback_link" A..= feedback_link_,
          "is_full" A..= is_full_,
          "is_rtl" A..= is_rtl_,
          "version" A..= version_,
          "view_count" A..= view_count_,
          "page_blocks" A..= page_blocks_
        ]

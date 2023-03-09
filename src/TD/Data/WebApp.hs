{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.WebApp where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Photo as Photo
import qualified Utils as U

-- |
data WebApp = -- | Describes a Web App. Use getInternalLink with internalLinkTypeWebApp to share the Web App
  WebApp
  { -- | Web App animation; may be null
    animation :: Maybe Animation.Animation,
    -- | Web App photo
    photo :: Maybe Photo.Photo,
    -- |
    description :: Maybe String,
    -- | Web App title
    title :: Maybe String,
    -- | Web App short name
    short_name :: Maybe String
  }
  deriving (Eq)

instance Show WebApp where
  show
    WebApp
      { animation = animation_,
        photo = photo_,
        description = description_,
        title = title_,
        short_name = short_name_
      } =
      "WebApp"
        ++ U.cc
          [ U.p "animation" animation_,
            U.p "photo" photo_,
            U.p "description" description_,
            U.p "title" title_,
            U.p "short_name" short_name_
          ]

instance T.FromJSON WebApp where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "webApp" -> parseWebApp v
      _ -> mempty
    where
      parseWebApp :: A.Value -> T.Parser WebApp
      parseWebApp = A.withObject "WebApp" $ \o -> do
        animation_ <- o A..:? "animation"
        photo_ <- o A..:? "photo"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        short_name_ <- o A..:? "short_name"
        return $ WebApp {animation = animation_, photo = photo_, description = description_, title = title_, short_name = short_name_}
  parseJSON _ = mempty

instance T.ToJSON WebApp where
  toJSON
    WebApp
      { animation = animation_,
        photo = photo_,
        description = description_,
        title = title_,
        short_name = short_name_
      } =
      A.object
        [ "@type" A..= T.String "webApp",
          "animation" A..= animation_,
          "photo" A..= photo_,
          "description" A..= description_,
          "title" A..= title_,
          "short_name" A..= short_name_
        ]

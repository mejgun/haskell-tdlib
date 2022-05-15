{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ThemeParameters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ThemeParameters = -- | Contains parameters of the app theme @background_color A color of the background in the RGB24 format @text_color A color of text in the RGB24 format
  ThemeParameters
  { -- | A color of text on the buttons in the RGB24 format
    button_text_color :: Maybe Int,
    -- |
    button_color :: Maybe Int,
    -- |
    link_color :: Maybe Int,
    -- | A color of hints in the RGB24 format @link_color A color of links in the RGB24 format @button_color A color of the buttons in the RGB24 format
    hint_color :: Maybe Int,
    -- |
    text_color :: Maybe Int,
    -- |
    background_color :: Maybe Int
  }
  deriving (Eq)

instance Show ThemeParameters where
  show
    ThemeParameters
      { button_text_color = button_text_color_,
        button_color = button_color_,
        link_color = link_color_,
        hint_color = hint_color_,
        text_color = text_color_,
        background_color = background_color_
      } =
      "ThemeParameters"
        ++ U.cc
          [ U.p "button_text_color" button_text_color_,
            U.p "button_color" button_color_,
            U.p "link_color" link_color_,
            U.p "hint_color" hint_color_,
            U.p "text_color" text_color_,
            U.p "background_color" background_color_
          ]

instance T.FromJSON ThemeParameters where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "themeParameters" -> parseThemeParameters v
      _ -> mempty
    where
      parseThemeParameters :: A.Value -> T.Parser ThemeParameters
      parseThemeParameters = A.withObject "ThemeParameters" $ \o -> do
        button_text_color_ <- o A..:? "button_text_color"
        button_color_ <- o A..:? "button_color"
        link_color_ <- o A..:? "link_color"
        hint_color_ <- o A..:? "hint_color"
        text_color_ <- o A..:? "text_color"
        background_color_ <- o A..:? "background_color"
        return $ ThemeParameters {button_text_color = button_text_color_, button_color = button_color_, link_color = link_color_, hint_color = hint_color_, text_color = text_color_, background_color = background_color_}
  parseJSON _ = mempty

instance T.ToJSON ThemeParameters where
  toJSON
    ThemeParameters
      { button_text_color = button_text_color_,
        button_color = button_color_,
        link_color = link_color_,
        hint_color = hint_color_,
        text_color = text_color_,
        background_color = background_color_
      } =
      A.object
        [ "@type" A..= T.String "themeParameters",
          "button_text_color" A..= button_text_color_,
          "button_color" A..= button_color_,
          "link_color" A..= link_color_,
          "hint_color" A..= hint_color_,
          "text_color" A..= text_color_,
          "background_color" A..= background_color_
        ]

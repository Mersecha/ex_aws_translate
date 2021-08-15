defmodule ExAws.Translate do
  @moduledoc """
    Operations for AWS Translate
  """

  import ExAws.Utils, only: [camelize_keys: 2]

  def start_text_translation_job(
    source_language,
    target_language,
    data_access_role_arn,
    content_type,
    input_bucket_uri,
    output_bucket_uri,
    opts \\ []) do

    params =
      %{
        "ClientToken" => UUID.uuid4(),
        "DataAccessRoleArn" => data_access_role_arn,
        "SourceLanguageCode" => source_language,
        "TargetLanguageCodes" => target_language,
        "InputDataConfig" => %{
          "ContentType" => content_type,
          "S3Uri" => input_bucket_uri
        },
        "OutputDataConfig" => %{
          "S3Uri" => output_bucket_uri
        },
      }
      |> Map.merge(normalize_opts(opts))

    request(:start_text_translation_job, params)
  end

  def describe_text_translation_job(job_id) do
    params = %{"JobId" => job_id}

    request(:describe_text_translation_job, params)
  end

  defp request(action, params) do
    operation =
      action
      |> Atom.to_string()
      |> Macro.camelize()

    ExAws.Operation.JSON.new(:translate, %{
      data: params,
      headers: [
        {"X-Amz-Target", "AWSShineFrontendService_20170701.#{operation}"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
    })
  end

  defp normalize_opts(opts) do
    opts
    |> Enum.into(%{})
    |> camelize_keys(deep: false)
  end
end
